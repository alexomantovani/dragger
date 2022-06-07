//Import the Material package

//Create a StatefulWidget called ProcessingScreen

//Inside of the build() method return a Scaffold() with an AppBar()
//The AppBar() receives an arrow_back to pop back to the previous screen,
//a title "Carrinho" and a TextButton() to clean the shopping_cart called "Limpar".

//The Scaffold's body will return a PageView() widget with 3 different pages
//All 3 pages will cover the processing steps of ordering the users groceries
//The steps will be order preview before shipping, delivery or takeout summary and
//order preview after shipping.

//The Scaffold's bothomsheet property will get a CustomBottomSheet() widget,
//that ruturns a ListTile() displaying the order total and a IconButton that will trigger
//a ModalBottomSheet with order costs details. Right bellow the ListTile() widget,
//an ElevatedButton() widget to chage the PageView() pages using the pageViewController,
//keeping this function and "Continuar" name until the procesing screen 3, where it'll
//change it's name to "Fazer Pedido"  and will trigger the makeOrder() function,
//this function triggers the calculus function, dateTime() function and navigates to the 
//OrderDoneScreen()

