$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

     reader.onload = function (e) {
        $(".main").attr("src", e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

 $("#main-upload").change(function(){
    $(".main").removeClass("hidden");
    readURL(this);
  });
});
// for main pic function ends here

// for sub pics function from here
$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

     reader.onload = function (e) {
        $(".sub1").attr("src", e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

 $(".sub-upload-1").change(function(){
    $(".sub1").removeClass("hidden");
    readURL(this);
  });
});


$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

     reader.onload = function (e) {
        $(".sub2").attr("src", e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

 $(".sub-upload-2").change(function(){
    $(".sub2").removeClass("hidden");
    readURL(this);
  });
});


$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

     reader.onload = function (e) {
        $(".sub3").attr("src", e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

 $(".sub-upload-3").change(function(){
    $("sub3").removeClass("hidden");
    readURL(this);
  });
});
