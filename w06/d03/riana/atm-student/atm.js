// https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onload
// The load event fires at the end of the document loading process.
// At this point, all of the objects in the document are in the DOM,
// and all the images and sub-frames have finished loading.
window.onload = function(){
  var check_balance = 0.00;
  var save_balance = 0.00;

  var c_show_balance = document.getElementById('balance1');
  var ch_account = document.getElementById('checkingAccount');

  var s_show_balance = document.getElementById('balance2');
  var s_account = document.getElementById('savingsAccount');

  // https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onclick
  // The click event is raised when the user clicks on an element.
  document.getElementById("checkingDeposit").onclick = function(event){
    // Any code you put in here will be run when the checkingDeposit button is clicked
    check_balance = check_balance + parseFloat(document.getElementById('checkingAmount').value);
    c_show_balance.innerHTML = check_balance;

   if(check_balance > 0){
      ch_account.setAttribute('style','background-color: grey');
    }
  };

  document.getElementById("savingsDeposit").onclick = function(event){
    // Any code you put in here will be run when the savingsDeposit button is clicked
    save_balance = save_balance + parseFloat(document.getElementById('savingsAmount').value);
    s_show_balance.innerHTML = save_balance;

    if(save_balance > 0){
      s_account.setAttribute('style','background-color: grey');
    }
  };

  document.getElementById("checkingWithdraw").onclick = function(event){
    // Any code you put in here will be run when the checkingWithdraw button is clicked
    var check_withdraw = parseFloat(document.getElementById('checkingAmount').value);

      //if the withdrawal is more than the check balance & it's more that the check balance and the saving balance
      if((check_withdraw > check_balance) && ((check_withdraw - check_balance) > save_balance) ){
        alert("insufficient funds");
      } else {
        //if the withdrawal is not more than the check acc balance
        if((check_balance - check_withdraw) >= 0){
          check_balance -= check_withdraw;
        } else {
          //if the withdrawal is more than the check balance but less than the saving balance
          //withdraw the check balance
          check_withdraw -= check_balance;
          check_balance = 0;
          //withdraw the remainder from the savings
          save_balance -= check_withdraw;
          s_show_balance.innerHTML = save_balance;
          c_show_balance.innerHTML = check_balance;
        }

        if(check_balance == 0){
          ch_account.setAttribute('style','background-color: red');
        }
      }

      c_show_balance.innerHTML = check_balance;
  };

  document.getElementById("savingsWithdraw").onclick = function(event){
    // Any code you put in here will be run when the savingsWithdraw button is clicked
    var save_withdraw = parseFloat(document.getElementById('savingsAmount').value);

      if((save_withdraw > save_balance) && ((save_withdraw - save_balance) > check_balance)){
        alert("insufficient funds");
      } else {
        if((save_balance - save_withdraw) >= 0){
          save_balance -= save_withdraw;
        } else {
          save_withdraw -= save_balance;
          save_balance = 0;
          check_balance -= save_withdraw;
          s_show_balance.innerHTML = save_balance;
          c_show_balance.innerHTML = check_balance;
        }


        if(save_balance == 0){
          s_account.setAttribute('style','background-color: red');
        }
      }

    s_show_balance.innerHTML = save_balance;
  };

};

