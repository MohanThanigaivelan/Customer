
function sample(){
  var x=order_quantity.value;
  var y=order_cost.value;
  order_total.value=x*y
 }
$(document).ready(function(){
     $("input#place").click(function(){
        var stock=parseInt($( "input#order_stock" ).val());
        var quantity=parseInt($( "input#order_quantity" ).val());
        stock=stock-quantity
        $("input#order_stock").val(stock);
    });
     $("input#add").click(function(){
          var stock=parseInt($( "input#item_stock" ).val());
          var stock1=parseInt($( "input#item_stock1" ).val());
          stock=stock+stock1
          $( "input#item_stock" ).val(stock+"")
    });
    $("input#order_quantity").keyup(function(){
      console.log("I AM HERE")
        var stock=parseInt($( "input#order_stock" ).val());
        var quantity=parseInt($( "input#order_quantity" ).val());
        if (stock < quantity)
        {
           $("input#order_quantity").val("");
           $("input#order_total").val("");
          alert("Please Enter below stock value")
        }
    });
    $("select").change(function(){
      console.log("I am here")
    var k=$( "select#order_name" ).val();

     $.ajax({
  url: "/items/" + k,
  type: "get", //send it through get method
  
  success: function(response) {
    //Do Something
    $("input#order_cost").val(response.cost);
    $("input#order_stock").val(response.stock);

  },
  error: function(xhr) {
    console.log("failure")
    //Do Something to handle error
  }
});
    });
        });
