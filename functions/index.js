const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.createCustomToken = functions.https.onCall(async (data, context) => {
  const uid = data.uid; // Flutter에서 보낸 사용자 ID

  try {
    const customToken = await admin.auth().createCustomToken(uid);
    return {token: customToken};
  } catch (error) {
    console.error("Error creating custom token:", error.message);
    throw new functions.https.HttpsError("internal", "Token creation failed");
  }
});
