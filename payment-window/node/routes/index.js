var express = require("express");
var got = require("got");
var uuid = require("uuid").v4;

var router = express.Router();

var secretKey = "test_ak_ZORzdMaqN3wQd5k6ygr5AkYXQGwy";

router.get("/", function (req, res) {
  res.render("index");
});

router.get("/success", function (req, res) {
  got
    .post(
      "https://api.tosspayments.com/v1/payments/" +
        encodeURIComponent(req.query.paymentKey),
      {
        headers: {
          Authorization:
            "Basic " + Buffer.from(secretKey + ":").toString("base64"),
          "Content-Type": "application/json",
        },
        json: {
          orderId: req.query.orderId,
          amount: req.query.amount,
        },
        responseType: "json",
      }
    )
    .then(function (response) {
      console.log(response.body);

      res.render("success", {
        isSuccess: true,
        responseJson: response.body,
      });
    })
    .catch(function (error) {
      console.log(error);

      res.render("success", {
        isSuccess: false,
        responseJson: response.body,
      });
    });
});

router.get("/fail", function (req, res) {
  res.render("fail", {
    message: req.query.message,
    code: req.query.code,
  });
});

router.get("/va_callback", function (req, res) {
  req.body;
  res.render("va_callback", {
    secret: req.body.secret,
    code: req.body.code,
    orderId: req.body.orderId,
  });
});

module.exports = router;
