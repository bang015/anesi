<!DOCTYPE html>
<html>
<head>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <iframe id="youtubeFrame" width="560" height="315" src="" frameborder="0" allowfullscreen></iframe>
  </div>
</div>

<script>
var kkeys = [], konami = "38,38,40,40,37,39,37,39,66,65";
$(document).keydown(function(e) {
  kkeys.push( e.keyCode );
  if ( kkeys.toString().indexOf( konami ) >= 0 ){
    kkeys = [];
    openModal("https://www.youtube.com/embed/jOTfBlKSQYY");
  }
});

function openModal(videoUrl) {
  var modal = document.getElementById("myModal");
  var youtubeFrame = document.getElementById("youtubeFrame");
  var span = document.getElementsByClassName("close")[0];
  
  youtubeFrame.src = videoUrl;
  modal.style.display = "block";
  
  span.onclick = function() {
    youtubeFrame.src = "";
    modal.style.display = "none";
  }
  
  window.onclick = function(event) {
    if (event.target == modal) {
      youtubeFrame.src = "";
      modal.style.display = "none";
    }
  }
}
</script>

<style>
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0,0,0,0.8);
}

.modal-content {
  margin: auto;
  width: 80%;
  max-width: 720px;
  position: relative;
  top: 50%;
  transform: translateY(-50%);
}

.close {
  position: absolute;
  top: 10px;
  right: 20px;
  font-size: 28px;
  font-weight: bold;
  color: white;
  cursor: pointer;
}

iframe {
  width: 100%;
  height: 100%;
}
</style>

</body>
</html>