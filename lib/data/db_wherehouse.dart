//Import Material package if needed.

//Create enum to differentiate products by category and use them as key to the maps in DbWherehouse

//Create class DbWherehouse and extend it to the ChangeNotifier for the use of the Provider package

//Inside DbWherehouse create a map that will receive all the data to display and manipulate the products by the user
//This map will be a Map<String, Map<String, List<dynamic>>> called productDatabase
//The key to the broader map will be the product categories enums created before the class, the inside map keys will be
//the imageUrls of the products hardcoded from downloaded assets in the assets/images folder. To finish the variable
//typing, the values of this map will be a dynamic list composed of a String productId as the first element, a double 
//productPrice as the second element and an int productInventoryCount as the last element of the list.

//After the creation and definition of the DraggableProduct class
//Create a method that will generate a DraggableProduct on site by receiving a String category.
//This method will parse all the data needed in the productDatabase map, to send the right 
//product to the right SectionScreen, adding notifyListeners(). This will be an asyncronous method
//because we have to wait to get the imageUrls before they will be displayed in the SectionScreen
//This method will be called getProducts(String category).

//Create a private list that will receive the data from the Draggable widget dragged by the user.
//this list will be called _cartProducts.

//Create an unmodifiableListView that will get the private list above and send it to the cart where
//it`ll be displayed after the user draggs it. This unmodifiableListView will be called cartProducts.

//Create a function that will receive the data from the DraggableProduct and save it in the private list
//Also this function will trigger another function that calculates the users cartPartials.
//this function will be called saveCartProducts(GenericProduct genericProduct).

//Create a private list that will receive the Texts widgets from the getOrderPartial().
//this list will be called _orderValueSummary.

//Create an unmodifiableListView that will get the private list above and send it to the order preview modalBottomSheet where
//it`ll be displayed after the user presses a button. This unmodifiableListView will be called orderValueSummary.

//Create a private list that will receive the String imageUrls from the getOrderPartial().
//this list will be called _orderImageUrls.

//Create an unmodifiableListView that will get the private list above and send it to the order preview modalBottomSheet where
//it`ll be displayed after the user presses a button. This unmodifiableListView will be called orderImageUrls.

//Create a variable double that will receive the order partial subtotal. This variable will be called subTotal.

//Create a function that will receive the data from the DraggableProduct and the selected quantity as an integer,
//and will calculate the order partial without the delivery fee and minimum order fee and save it to the subTotal.
//using the data it`ll parse the productId, selected quantity and total price to String in a Text widget.
//this Text widget will be saved in _orderValueSummary.
//this function will be called getOrderPartial(GenericProduct genericProduct, int selectedQuantity).

//Create a variable double that will receive the order final total. This variavle will be called total.

//Create a variable double that will receive the order minimum fee. This variavle will be called serviceFee.

//Create a variable double that will receive the order delivery fee. This variavle will be called deliveryFee.

//Create a variable String that will receive the orderDayTimeStamp. This variable will be called orderDayTimeStamp.

//Create a function that get the order partial and checks if the minumum ammount was matched or not, and then
//adds the delivery fee and if applicable adds the minimum order fee and save it to the total variable. Then this function will get the 
//hour that the user pressed the Make the order button and will parse it into Hour:Minute:Seconds, saving it in the orderDayTimeStamp variable.
//this function will be called getOrderTotal()

//Create a variable bool isPaying that will get its state changed after the user presses the Make the order button
//from false to true and then to false again, signaling that the payment process is over. This variable will be called isPaying.

//Create a function that will be triggered after the user presses the Make the order button and will change the isPaying state 
//to true, then it`ll wait for 2 seconds to then change isPaying to false again.
//This function will asyncronous and will be called getPayment().

//Create function that will restart the application state by deleting all elements from
//_cartProducts,_orderImageUrls,_orderValueSummary,subTotal = 0.0, total = 0.0;
//and then it`ll navigate to the initial screen. This function will be called getInitialState().