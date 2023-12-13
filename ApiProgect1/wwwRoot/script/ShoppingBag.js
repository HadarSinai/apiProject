let data = sessionStorage.getItem("ProductsCart")
let cart = JSON.parse(data);
let user = sessionStorage.getItem("user")
let users = JSON.parse(user);
let allSum = 0.0;

window.onload = () => {

    send();

}


const send = () => {

    allSum = 0;
    if (!sessionStorage.getItem("user")) {
        alert("you move login")
        window.location.href = "./user.html"
        return;
    }

    document.querySelector(".itemsColumn").innerText = cart.length + "פריטים"

    for (let i = 0; i < cart.length; i++) {
        allSum += cart[i].productPrice
        showCard(cart[i])

    }
    document.querySelector(".totalColumn").innerText = " סכום הזמנה " + allSum + "  $"


}


const showCard = (data) => {

    let temp = document.getElementById("temp-row")
    let clone = temp.content.cloneNode(true)
    clone.querySelector("img").src = "./potos/" + data.productImage
    clone.querySelector("h3.itemName").innerText = data.productName
    clone.querySelector(".price").innerText = data.productPrice +"$"
    clone.querySelector(".totalColumn").addEventListener('click', () => { deleteCartProduct(data) })
    document.querySelector("tbody").appendChild(clone)

}

const deleteCartProduct = (data) => {
    cart = cart.filter(prod => prod != data);
    sessionStorage.setItem("ProductsCart", JSON.stringify(cart))
    document.querySelector("tbody").innerHTML = '';
    send();


}


const placeOrder = async () => {
    let quantity = 0;
    let tempOrderItem = [];
    let WasOrderItems = [];
    let order;
    let was;
    let amount;
    let idProducts = [];

    let res = sessionStorage.getItem("ProductsCart")
    let cartProducts = JSON.parse(res);

    order = {
        userId: users.userId,
        orderSum: allSum,
        orderDate: new Date(),
        OrderItems: []
    }
    for (let i = 0; i < cartProducts.length; i++) {


        if (WasOrderItems.length == 0) {
            WasOrderItems.push(cartProducts[i])
            amount = cartProducts.filter(l => l.productId == cartProducts[i].productId).length
            orderItem = {
                ProductId: cartProducts[i].productId,
                Quantity: amount
            }
            tempOrderItem = [...tempOrderItem, orderItem]
        }
        else {
            was = WasOrderItems.find(s => s.productId == cartProducts[i].productId)
            amount = cartProducts.filter(l => l.productId == cartProducts[i].productId).length

            if (was == undefined) {

                if (amount > 1)
                    quantity = amount;
                else
                    if (amount == 1)
                        quantity = 1;

                orderItem = {
                    ProductId: cartProducts[i].productId,
                    Quantity: quantity
                }
                WasOrderItems = [...WasOrderItems, cartProducts[i]]
                tempOrderItem = [...tempOrderItem, orderItem]
            }
        }

    }
    order.OrderItems = tempOrderItem

    try {
        let url = `api/Product/checkSumOrder?&sumOrder=${allSum}`
        for (let t = 0; t < cartProducts.length; t++) {
            idProducts.push(cartProducts[t].productId)
            url += `&IdProducts=${cartProducts[t].productId}`
        }
        const res = await fetch(url)

        const bool = await res.json();

        if (bool == false) {
            alert("סכום ההזמנה אינו תקין")
            return;
        }



    }
    catch (ex) {
        alert(ex)
    }
    saveOrder(order)
}

const saveOrder = async (order) => {

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
            alert(`order ${data.orderId} created succfully`)
           
        }
    }
    catch (ex) {
        alert(ex)
    }
}