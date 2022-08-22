const functions = require("firebase-functions");
const admin = require("firebase-admin");
const auth = require("firebase-auth");
const axios = require("axios");
const randomName = require("@woowa-babble/random-nickname");

const apiKey = process.env.KAKAO_API_KEY;

var serviceAccount = require("./dtrade-be228-firebase-adminsdk-ep0jk-9daf7301cc.json");
const { getRandomNickname } = require("@woowa-babble/random-nickname");
const {
  MultiFactorAuthConfig,
} = require("firebase-admin/lib/auth/auth-config");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL:
    "https://dtrade-be228-default-rtdb.asia-southeast1.firebasedatabase.app",
});

exports.createCustomToken = functions.https.onRequest(
  async (request, response) => {
    const user = request.body;

    const uid = `kakao:${user.uid}`; // 카카오 유저 ID
    const idToken = user.idToken; // 카카오 Access Token

    // kakao id token 검증
    // 추후 추가 예정

    const updateParams = {};

    try {
      await admin.auth().updateUser(uid, updateParams);
    } catch (e) {
      updateParams["uid"] = uid;
      updateParams["displayName"] = randomName.getRandomNickname("animals");
      await admin.auth().createUser(updateParams);
    }

    const token = await admin.auth().createCustomToken(uid);

    response.send(token);
  }
);
