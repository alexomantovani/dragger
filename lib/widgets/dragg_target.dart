//Import Material package.
//Import Provider package.

//Criar um statefulWidget called DraggTarget.

//Inside the DraggTarget state create a DbWherehouse variable and initialize it with DbWherehouse() called dB.

//Create a didChageDependecies() method and initialize dB with the Provider package.

//Inside the build method return a DragTarget widget of DragTarget<GenericProduct>().
//In its builder function proportie check if the dB.cartProducts isEmpty, if it is empty,
//return only the supermarket_cart picture. If it is not empty, return a Stack widget
//with the supermarket_cart on top and the dB.cartProducts above.
//In its onAccept: (data){} function property call the setState method with the dB.getCartProducts(data).
//And then call the showDialog<void>() method for Android and showCupertinoDialog<void>() for iOS that will
//be in its respective files.
