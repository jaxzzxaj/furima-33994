// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

// const channels = require.context('.', true, /_channel\.js$/)
// channels.keys().forEach(channels)

function taxes(){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('change',() => {
    const price = itemPrice.value;
    const addTaxPrice =document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const taxPrice = price * 0.1;
    const saleProfit = price - taxPrice;

    addTaxPrice.innerHTML = taxPrice;
    profit.innerHTML = saleProfit;
  })
}

window.addEventListener("load", taxes);