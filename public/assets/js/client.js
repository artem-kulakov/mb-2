// Set your publishable key: remember to change this to your live publishable key in production
// See your keys here: https://dashboard.stripe.com/account/apikeys
var stripe = Stripe('pk_test_5LZWgoJKuKjk88n3o8o8UuAU00hjM6oe94');



var elements = stripe.elements();

// Custom styling can be passed to options when creating an Element.
var style = {
  base: {
    color: '#151b26',
    fontWeight: 400,
    fontFamily: '"Roboto", Helvetica, Arial, sans-serif',
    fontSize: '16px',
    fontSmoothing: 'antialiased',

    '::placeholder': {
      color: '#8A98A5',
    },
  },
};

// Create an instances of the card Elements.
var cardNumber = elements.create('cardNumber', {style: style});
cardNumber.mount('#example3-card-number');

var cardExpiry = elements.create('cardExpiry', {style: style});
cardExpiry.mount('#example3-card-expiry');

var cardCvc = elements.create('cardCvc', {style: style});
cardCvc.mount('#example3-card-cvc');



// Create a token or display an error when the form is submitted.
var form = document.getElementById('payment-form');
form.addEventListener('submit', function(event) {
  event.preventDefault();

  stripe.createToken(cardNumber).then(function(result) {
    if (result.error) {
      // Inform the customer that there was an error.
      var errorElement = document.getElementById('card-errors');
      errorElement.textContent = result.error.message;
    } else {
      // Send the token to your server.
      stripeTokenHandler(result.token);
    }
  });
});

function stripeTokenHandler(token) {
  // Insert the token ID into the form so it gets submitted to the server
  var form = document.getElementById('payment-form');
  var hiddenInput = document.createElement('input');
  hiddenInput.setAttribute('type', 'hidden');
  hiddenInput.setAttribute('name', 'stripeToken');
  hiddenInput.setAttribute('value', token.id);
  form.appendChild(hiddenInput);

  // Submit the form
  form.submit();
}



// Alipay and WeChat
$(document).ready(function() {
  // Alipay
  $( ".alipay-button" ).click(function() {
    stripe.createSource({
      type: 'alipay',
      amount: 10999,
      currency: 'usd',
      redirect: {
        return_url: 'http://localhost:3000/checkout/payment',
      },
    }).then(function(result) {
      // handle result.error or result.source
      window.location.replace(result.source.redirect.url);
    });
  });

  // Wechat
  $( ".wechat-button" ).click(function() {
    // Disable button
    $( ".wechat-button" ).attr("disabled", true);

    // Charge source
    stripe.createSource({
      type: 'wechat',
      amount: 10000,
      currency: 'usd',
      statement_descriptor: 'wechat',
      owner: {
        name: 'WeChat Pay client',
      },
    }).then(function(result) {
      // handle result.error or result.source

      // Show QR code
      $('#qrcode-container').append('<div class="col-sm-12 text-center mb-5"><div id="qrcode" class="d-inline-block"></div></div>');
      new QRCode(document.getElementById("qrcode"), result.source.wechat.qr_code_url);

      // Redirect to 'checkout/review' when source becomes chargeable
      var json = { "id" : result.source.id}
      setInterval(function() {
        $.getJSON( "did_customer_react", json, function( data ) {
          if(data.response == 'yes') {
            window.location.href = '/checkout/payment';
            // window.location.href = '/checkout/review?source=' + result.source.id;
          }
        });        
      }, 2000);
    });
  });
});
