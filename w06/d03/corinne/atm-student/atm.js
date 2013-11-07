// https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onload
// The load event fires at the end of the document loading process.
// At this point, all of the objects in the document are in the DOM,
// and all the images and sub-frames have finished loading.
window.onload = function(){

  // https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onclick
  // The click event is raised when the user clicks on an element.
  document.getElementById("checkingDeposit").onclick = function(event){
    // Any code you put in here will be run when the checkingDeposit button is clicked
    var amount = document.getElementById('checkingAmount').value;
    amount = parseFloat(amount);
//Couldnt get this to work without an if statement
    checking.deposit(amount)
      balanceDisplayUpdate(checking.balance, savings.balance);

    if (balanceZero(checking.balance) === true) {
      checkBoxC.style.backgroundColor = 'red';
    } else {
      checkBoxC.style.backgroundColor = 'green';
    };
    document.getElementById('checkingAmount').value = '';

  };

  document.getElementById("savingsDeposit").onclick = function(event){
    // Any code you put in here will be run when the savingsDeposit button is clicked
    var amount = document.getElementById('savingsAmount').value;
    amount = parseFloat(amount);
//Couldnt get this to work without an if statement
    if (savings.deposit(amount) === true) {
      balanceDisplayUpdate(checking.balance, savings.balance);
    };

    if (balanceZero(savings.balance) === true) {
      checkBoxS.style.backgroundColor = 'red';
    } else {
      checkBoxS.style.backgroundColor = 'green';
    };
    document.getElementById('savingsAmount').value = '';

  };

  document.getElementById("checkingWithdraw").onclick = function(event){
    // Any code you put in here will be run when the checkingWithdraw button is clicked
    var amount = document.getElementById('checkingAmount').value;
    amount = parseFloat(amount);
    if (checking.withdrawal(amount) === true) {
      balanceDisplayUpdate(checking.balance, savings.balance);
    } else {
      alert("Insufficient Funds");
    };

    if (balanceZero(checking.balance) === true) {
      checkBoxC.style.backgroundColor = 'red';
    } else {
      checkBoxC.style.backgroundColor = 'green';
    };
    if (balanceZero(savings.balance) === true) {
      checkBoxS.style.backgroundColor = 'red';
    } else {
      checkBoxS.style.backgroundColor = 'green';
    };
    document.getElementById('checkingAmount').value = '';
  };

  document.getElementById("savingsWithdraw").onclick = function(event){
    // Any code you put in here will be run when the savingsWithdraw button is clicked
    var amount = document.getElementById('savingsAmount').value;
    amount = parseFloat(amount);
    if (savings.withdrawal(amount) === true) {
      balanceDisplayUpdate(checking.balance, savings.balance);
    } else {
      alert("Insufficient Funds");
    };
    if (balanceZero(savings.balance) === true) {
      checkBoxS.style.backgroundColor = 'red';
    } else {
      checkBoxS.style.backgroundColor = 'green';
    };
    if (balanceZero(checking.balance) === true) {
      checkBoxC.style.backgroundColor = 'red';
    } else {
      checkBoxC.style.backgroundColor = 'green';
    };

    document.getElementById('savingsAmount').value = '';

  };



  var checkingBalanceDisplay = document.getElementById('balance1');
  var savingsBalanceDisplay = document.getElementById('balance2');

  var balanceDisplayUpdate = function(checkBal, savBal) {
    checkingBalanceDisplay.innerHTML = checkBal;
    savingsBalanceDisplay.innerHTML = savBal;
  };
  balanceDisplayUpdate(checking.balance, savings.balance);



  var checkBoxC  = document.getElementById('checkingAccount');
  var checkBoxS  = document.getElementById('savingsAccount');

  var balanceZero = function (zeroBal) {
    return (zeroBal === 0);
  };


};












var checking = {
  balance: 0,
  deposit: function (amount) {
    this.balance += amount;
    return true;
  },
  withdrawal: function (amount) {
    if (sufficientFunds(amount)) {
      var ob = overBalance(amount, this.balance);
      if (ob >= 0) {
        this.balance -= amount;
      } else {
        this.balance = 0;
        savings.balance += ob;
      };
      return true;
    } else {
      return false;
    };
  }
};

var savings = {
  balance: 0,
  deposit: function (amount) {
    this.balance += amount;
    return true;
  },
  withdrawal: function (amount) {
    if (sufficientFunds(amount)) {
      var ob = overBalance(amount, this.balance)
      if (ob >= 0) {
        this.balance -= amount;
      } else {
        this.balance = 0;
        checking.balance += ob;
      };
      return true;
    } else {
      return false;
    };
  }
};



var totalBalance = function () {
  return checking.balance + savings.balance;
};

var sufficientFunds = function(amount) {
  return (amount <= totalBalance());
};

var overBalance = function(amount, balance) {
  return (balance - amount);
};

savings.deposit(100);
checking.deposit(20);
checking.deposit(3);

console.log(savings.balance);
console.log(checking.balance);





















