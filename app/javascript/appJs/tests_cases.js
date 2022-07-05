/**
 * Display the rows in the test steps table. The table has 4 columns. You
 * much pass each columns as param
 *
 *
 * @param {*} stepId the step ID. Must be the same as the index
 * @param {String} inputAction the test action step
 * @param {String} inputData the test data step
 * @param {String} inputResult the test result step
 */
function addRow(stepId, isEditable, inputAction, inputData, inputResult) {
  const deleteBt = `<td>
                    <button 
                    type="button" 
                    class="button is-danger is-outlined bt-test-step-remove"
                    value="${stepId}"
                    >
                        <span 
                        class="icon is-small"
                        value="${stepId}"
                        >
                            <ion-icon name="trash"></ion-icon>
                        </span>
                    </button>
                </td>`;

  $(".tb-test-steps").append(
    `
                <tr id="${stepId}">
                <th>${stepId}</th>
                <td>${inputAction}</td>
                <td>${inputData}</td>
                <td>${inputResult}</td>
                ${isEditable ? deleteBt : ""}
                </tr>
            `
  );
}

/**
 * A simple function to clean up the table by removing all the
 * child elements (tr) in the table
 */
function cleanTable() {
  $(".tb-test-steps").empty();
}

/**
 *
 * @returns
 */
function readTestSteps(elementId) {
  let inputSteps = $(elementId).val();
  let newSteps = { steps: [] };

  if (inputSteps) {
    try {
      newSteps = $.parseJSON(inputSteps);
    } catch (error) {
      console.log(error);
    }
  }

  return newSteps;
}

function updateTestSteps(newSteps) {
  $("#test-steps-input").val(JSON.stringify(newSteps));
}

function displayStep(isEditable) {
  const elementId = isEditable ? "#test-steps-input" : "#test-steps-display";
  let newSteps = readTestSteps(elementId)["steps"];

  newSteps.forEach((element, index) => {
    addRow(index, isEditable, ...element);
  });
}

function addStep(inputAction, inputData, inputResult) {
  let newSteps = readTestSteps("#test-steps-input");
  newSteps["steps"].push([inputAction, inputData, inputResult]);

  updateTestSteps(newSteps);
  cleanTable();
  displayStep(true);
}

function deleteRow(rowId) {
  let newSteps = readTestSteps("#test-steps-input");

  const result = newSteps["steps"].filter((_, index) => index != rowId);
  newSteps["steps"] = result;

  updateTestSteps(newSteps);
  cleanTable();
  displayStep(true);
}

$("#test-steps-display").ready(() => displayStep(false));
$("#test-steps-input").ready(() => displayStep(true));

$(".table-test-cases").on("click", ".bt-test-step-remove", (event) => {
  deleteRow($(event.target).attr("value"));
});

$(".bt-test-step-add").click(() => {
  const inputAction = $(".input-test-step-action").val();
  const inputData = $(".input-test-step-data").val();
  const inputResult = $(".input-test-step-result").val();
  const emptyValue = "";

  addStep(inputAction, inputData, inputResult);

  $(".input-test-step-action").val(emptyValue);
  $(".input-test-step-data").val(emptyValue);
  $(".input-test-step-result").val(emptyValue);
});
