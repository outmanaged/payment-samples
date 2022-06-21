var express = require("express");
var got = require("got");
var uuid = require("uuid").v4;

var router = express.Router();

var secretKey = "test_ak_ZORzdMaqN3wQd5k6ygr5AkYXQGwy";

router.get("/inquiry", function (req, res) {
  let paymentKey = "2WkABYDxNyJQbgMGZzorzQbpRBkAvVl5E1em4dKva7XL9njP";

  //중복 취소를 막기위해 취소 가능금액을 전송
  let refundableAmount = 300;

  got("https://api.tosspayments.com/v1/payments/" + paymentKey, {
    headers: {
      Authorization: "Basic " + Buffer.from(secretKey + ":").toString("base64"),
    },

    responseType: "json",
  })
    .then(function (response) {
      res.render("inquiry", {
        isSuccess: true,
        responseJson: response.body,
      });
    })
    .catch(function (error) {
      res.render("inquiry", {
        isSuccess: false,
        responseJson: error.response.body,
      });
    });
});

module.exports = router;
