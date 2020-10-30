
const API = window["API"];
const { Mesh, BoxGeometry, MeshBasicMaterial, DirectionalLight } = API.THREE;
import { FreeCam } from "../default/freecam.js";
import * as wld from "../default/wld.js";
import * as ini from "../default/ini.js";
import { RAD_180 } from "../default/lookcamera.js";

let api = API.get();

let physics = api.getPhysicsManager();
let renderer = api.getRenderer();
let res = api.getResourceManager();

async function init() {

  let freecam = new FreeCam();
  freecam.mount(api.renderer.getScene());

  renderer.setCamera(freecam.camera);

  freecam.position.set(0, 0, 10);

  api.getTimeManager().listen((delta) => {
    freecam.update();
  });

  let dirLight = new DirectionalLight( 0xffffff, 0.5 );
  renderer.getScene().add( dirLight );

  // let odf = await res.getResource("@bes2:/odf/bluelight.odf");

  // let odfDef = ini.parse(odf.text());

  // odfDef.forEach((scope, key)=>{
  //   console.log(key);
  //   scope.values.forEach((value, key)=>{
  //     console.log(key, ":", value);
  //   });
  // });
  
  let worldDefRes = await res.getResource("@bes2:/world/bespin2.wld");
  let worldDef = wld.parse(worldDefRes.text());

  for (let placement of worldDef.placements) {
    let model = await res.getResourceModel(`@bes2:/models/${placement.file}.glb`).catch(() => {
      // console.warn("Couldn't find", placement.file);
    });
    if (model) {
      for (let scene of model.scenes) {
        scene.position.set(
          -placement.info.posx,
          placement.info.posy,
          placement.info.posz
        );
        scene.quaternion.set(
          placement.info.rotx,
          placement.info.roty,
          placement.info.rotz,
          placement.info.rotw
        );
        scene.traverse((child:any) => {
          if (child.isMesh && child.material) {
            if (child.material.metalness > 0.95) {
              child.material.metalness = 0.88;
              // child.material.metalness = 0;
            }
          }
        });
        renderer.getScene().add(scene);
        scene.rotateX(RAD_180);
      }
      
    }
  }

  let visual = new Mesh(
    new BoxGeometry(2, 2, 2),
    new MeshBasicMaterial({ color: 0x55ffff })
  );
  let body = physics.makeBody({
    mass: 1,
    shape: new Ammo.btBoxShape(new Ammo.btVector3(1, 1, 1)),
    x: 0,
    y: 3,
    z: 0
  }).setNativeObject3D(visual);
  renderer.getScene().add(body.getNativeObject3D());
  physics.addBody(body);

  let groundVisual = new Mesh(
    new BoxGeometry(2, 2, 2),
    new MeshBasicMaterial({ color: 0x553333 })
  );
  let groundBody = physics.makeBody({
    mass: 0,
    shape: new Ammo.btBoxShape(new Ammo.btVector3(1, 1, 1)),
    x: 0,
    y: -1,
    z: 0
  }).setNativeObject3D(groundVisual);

  renderer.getScene().add(groundBody.getNativeObject3D());
  physics.addBody(groundBody);
}

init();
