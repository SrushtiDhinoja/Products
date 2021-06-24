$(document).on('turbolinks:load',function(){
    dropdown_value_change();
});
function dropdown_value_change() {
$("select#product").hide();
    $("#first").on('change' , function(){
    $("div#product-list").empty();
    var selectedProduct = $(this).children("option:selected").val();
    if(selectedProduct == ''){
      $("select#product").hide();
      $("div#product-list").empty();
    }
    else if (selectedProduct == 'heading') {
      $("select#product").show();
      $("div#product-list").empty();
      select_heading();
    }
    else if (selectedProduct == 'category') {
      $("select#product").show();
      $("div#product-list").empty();
      select_category();
    }
    else{
      $("select#product").hide();
      $("div#product-list").empty();
    }
  });
}

function select_heading() {
  $.ajax({
    type: "get",
    url: "/product_category_headings",
    dataType: "script",
    data: ""
  });
}
function select_category() {
  $.ajax({
    type: "get",
    url: "/product_categories",
    dataType: "script",
    data: ""
  });
}

