﻿let data =  sessionStorage.getItem("ProductsCart")
let cart =  JSON.parse(data);
let user = sessionStorage.getItem("user")
let users = JSON.parse(user);

window.onload = () => {

    send();
   
}


const send = () => {
    // const data = await sessionStorage.getItem("ProductsCart")
   
    if (!sessionStorage.getItem("user")) {
        alert("you move login")
        window.location.href = "./user.html"
        return;
    }
    for (let i = 0; i < cart.length; i++) {
        showCard(cart[i])
        
    }
    
}


const showCard = (data) => {
 
    let temp = document.getElementById("temp-row")
    let clone = temp.content.cloneNode(true)
   clone.querySelector("img").src = "./potos/" + data.productImage
    clone.querySelector("h3.itemName").innerText = data.productName
    clone.querySelector(".price").innerText = data.productPrice
    clone.querySelector(".totalColumn").addEventListener('click', () => { deleteCartProduct(data) })
    document.querySelector("tbody").appendChild(clone)

}

const deleteCartProduct = (data) => {
    cart = cart.filter(prod => prod != data);
    sessionStorage.setItem("ProductsCart", cart)
    document.querySelector("tbody").replaceChildren([])
    send();
 
  
}


const placeOrder = async () => {
  
    let allSum = 0.0;
    let quantity = 0;
    let orderItem=[];
    let WasOrderItems = [];
    let order;
    let was;
    let ids = [];
    
let res = sessionStorage.getItem("ProductsCart")
    let cartProducts = JSON.parse(res);
   
    for (let i = 0; i < cartProducts.length; i++) {
        allSum += cartProducts[i].productPrice;
       
        if (WasOrderItems.length == 0) {
           WasOrderItems.push(cartProducts[i].productId)
          
        }
        else 
        was = WasOrderItems.filter(s => s.productId != cartProducts[i].productId).length
        ids = cartProducts.filter(l => l.productId == cartProducts[i].productId).length
        
        if (was != null) {
            
            if (ids > 1)
                quantity = ids;
            else
            if(ids.length==1)
                quantity = 1;
            orderItem = {
                ProductId: cartProducts[i].productId
,
                Quantity: quantity
            }
             WasOrderItems = [...WasOrderItems, cartProducts[i].productId]
        }
    }
      order = {
        userId: users.userId,
        orderSum: allSum,
          orderDate: new Date(),
          OrderItems: []
    }
    order.OrderItems = [...order.OrderItems, orderItem]
   
    try {
        const res = await fetch('api/Orders/post', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(order)
        });
        if (!res.ok) {
            throw new Error("try agian,we cant saved the order")
        }
        else {
            const data = await res.json();
            alert(`order ${data.orderId} created succfully`) }
    }
    catch (ex) {
        alert(ex)
    }
}