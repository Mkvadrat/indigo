$(document).ready(function() {
    $('.best-proposes .owl-carousel').owlCarousel({
        responsive : {
            1200 : {
                items   : 5,
            },
            991 : {
                items   : 4,
            },
            768 : {
                items   : 3,
            },
            480 : {
                items   : 2,
            },
            0 : {
                items   : 1,
            }
        },
        nav     : true,
        dots    : false,
        margin  : 15,
    });
    $('.review-main .owl-carousel').owlCarousel({
        items   : 1,
        nav     : true,
        dots    : false,
        responsive : {
            1200 : {
                margin  : 100,
            },
            991 : {
                margin  : 50,
            }
        }
    });
    $('.imgs .owl-carousel').owlCarousel({
        items   : 1,
        nav     : true,
        dots    : false,
        URLhashListener:true,
        startPosition: 'URLHash'
    });
    $("#menu").mmenu({
        "extensions": [
            "pagedim-black"
        ],
        "iconPanels": true,
        navbar: {
            title: "АН «Индиго»"
        }
    });
    
    $('.callback').fancybox({
        modal: true,
    });

    $( "#sort-items" ).selectmenu({
        appendTo: "label[for='sort-items-button']"
    });
    $( "#view-items" ).selectmenu({
        appendTo: "label[for='view-items-button']"
    });
    $( "#chose-type" ).selectmenu({
        appendTo: "label[for='chose-type-button']"
    });
    
    $( "#sort-items" ).on( "selectmenuchange", function( event, ui ) {
        location = this.value;
    });
    
    $( "#view-items" ).on( "selectmenuchange", function( event, ui ) {
        location = this.value;
    });
});

//Product and cases page forms
function sendFormAgent() {
    $.ajax({
        url: 'index.php?route=product/product/sendFormAgent',
        type: 'post',
        data: {
            'name': $('#name_agent').val(),
            'tel': $('#phone_agent').val(),
            'email': $('#email_agent').val(),
            'email_agent': $('#hidden_email').val(),
            'product_agent': $('#hidden_product_id').val(),
            'message': $('#message_agent').val(),
        },
        dataType: 'json',
        success: function (data) {
            swal({
                title: data.message,
                text: "",
                timer: 1000,
                showConfirmButton: false
            });

            $.fancybox.close();
        }
    });
}