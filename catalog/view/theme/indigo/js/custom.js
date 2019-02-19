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
    
    $('#print').on('click', function () {
        $("#print01, #print1, #print2, #print3, #print4, #print5, #print6, #print7, #print8, #print9, #print10, #print11").printThis({
            debug: false, // show the iframe for debugging
            importCSS: true, // import page CSS
            importStyle: true, // import style tags
            printContainer: true, // grab outer container as well as the contents of the selector
            loadCSS: "catalog/view/theme/villacrimea/stylesheet/stylesheet.css", // path to additional css file - use an array [] for multiple
            pageTitle: "", // add title to print page
            removeInline: true, // remove all inline styles from print elements
            printDelay: 333, // variable print delay
            header: null, // prefix to html
            footer: null, // postfix to html
            base: false, // preserve the BASE tag, or accept a string for the URL
            formValues: true, // preserve input/form values
            canvas: true, // copy canvas elements (experimental)
            doctypeString: "...", // enter a different doctype for older markup
            removeScripts: false, // remove script tags from print content
            copyTagClasses: false // copy classes from the html & body tag
        });
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