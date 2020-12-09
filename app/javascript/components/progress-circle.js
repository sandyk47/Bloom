// Adapted from https://bootstrapious.com/p/circular-progress-bar
export const drawProgressCircles = () => {
    const progressEls = document.querySelectorAll(".progress");
    if (progressEls) {
      progressEls.forEach(function (progressEl) {
        var value = progressEl.dataset.value;
        var left = progressEl.querySelector(".progress-left .progress-bar");
        var right = progressEl.querySelector(".progress-right .progress-bar");
  
        if (value > 0) {
          if (value <= 50) {
            right.style.transform =
              "rotate(" + percentageToDegrees(value) + "deg)";
          } else {
            right.style.transform = "rotate(180deg)";
            left.style.transform =
              "rotate(" + percentageToDegrees(value - 50) + "deg)";
          }
        }
      });
    }
  };
  
  function percentageToDegrees(percentage) {
    return (percentage / 100) * 360;
  }
  