let data =  sessionStorage.getItem("ProductsCart")
let cart =  JSON.parse(data);
let user = sessionStorage.getItem("user")
let users = JSON.parse(user);

window.onload = () => {

    send();
   
}


const send = () => {
    // const data = await sessionStorage.getItem("ProductsCart")
   
    if ( user= null) {
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
     /*   .addEventListener('click', () => { deleteCartProduct(data) })*/
   
    document.querySelector("tbody").appendChild(clone)

}

const deleteCartProduct = (data) => {
    cart = cart.filter(prod => prod != data);
    sessionStorage.setItem("ProductsCart", cart)
    document.querySelector("tbody").replaceChildren([])
    send();
 
  
}
//let index = myCart.findIndex(p => p.productId == product.productId);

const placeOrder = async () => {
    let order = {

            userId : users.userId,
        orderSum:40,
            /*sum_money,*/
        orderDate: new Date(),
        OrderItems: []
    }
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
        else { alert("yor order is ok👏") }
    }
    catch (ex) {
        alert(ex)
    }
}