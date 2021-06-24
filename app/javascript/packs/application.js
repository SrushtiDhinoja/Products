// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require cocoon
//= require popper
//= require bootstrap-modal
//= require product
//= require_tree


import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("jquery")
require("@nathanvda/cocoon")
Rails.start()
Turbolinks.start()
ActiveStorage.start()
$(document).on('turbolinks:load',function(){
  // print_error_message();
  selected_dropdown_value();
});
function print_error_message(){
  $('div#error').css("color","red");
}
function selected_dropdown_value() {
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
