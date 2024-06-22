import "@tensorflow/tfjs";
import "@tensorflow/tfjs-core";
import "@tensorflow/tfjs-backend-webgl";
import * as faceDetection from "@tensorflow-models/face-detection";

import { startWebcam, takePicture, drawFaceBox } from "./utils";

const webcamButton = document.getElementById("webcam");
const captureButton = document.getElementById("pause");
const video = document.querySelector("video");

let model, detector;

const init = async () => {
  model = faceDetection.SupportedModels.MediaPipeFaceDetector;
  detector = await faceDetection.createDetector(model, { runtime: "tfjs" });
};

webcamButton.onclick = () => startWebcam(video);
captureButton.onclick = () => takePicture(video, predict);

const predict = async (img) => {
  const predictions = await detector.estimateFaces(img, {
    flipHorizontal: false,
  });

  console.log(predictions);
  drawFaceBox(img, predictions);
};

init();
