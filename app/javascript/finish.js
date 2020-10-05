// function finish() {
//   const tasks = document.querySelectorAll(".task");
//   tasks.forEach(function (task) {
//     task.addEventListener("click", () => {
//       const taskID = task.getAttribute("data-id");
//       const XHR = new XMLHttpRequest();
//       XHR.open("GET", `/tasks/${taskID}`, true);
//       XHR.responseType = "json";
//       XHR.send();
//       XHR.onload = () => {
//         if (XHR.status != 200) {
//           alert(`Error ${XHR.status}: ${XHR.statusText}`);
//           return null;          
//         }
//         const item = XHR.response.task;
//         if (item.finished_at === true) {
//           task.setAttribute("data-finish", "true");
//         } else if (item.finished_at === false) {
//           task.removeAttribute("data-finish");
//         }
//       };
//     });
//   });
// }

// window.addEventListener("load", finish);