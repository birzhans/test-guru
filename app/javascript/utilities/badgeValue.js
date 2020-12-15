document.addEventListener('turbolinks:load', function() {
  var ruleTypeSelector = document.querySelector('#badge_rule')

  if (ruleTypeSelector) {
    ruleTypeSelector.addEventListener('change', ruleValueSelectorChange)
  }
})

function ruleValueSelectorChange() {
  if (this.value == "first_try") {
    labelShow(".tests", ".categories", ".levels", ".all")
    valueShow(".rule_tests", ".rule_categories", ".rule_levels")
    setName(".rule_tests", ".rule_categories", ".rule_levels")

  } else if (this.value == "all_by_category") {
    labelShow(".categories", ".levels", ".tests", ".all")
    valueShow(".rule_categories", ".rule_tests", ".rule_levels")
    setName(".rule_categories", ".rule_tests", ".rule_levels")

  } else if (this.value == "all_by_level") {
    labelShow(".levels", ".tests", ".categories", ".all")
    valueShow(".rule_levels", ".rule_categories", ".rule_tests")
    setName(".rule_levels", ".rule_categories", ".rule_tests")

  } else {
    labelShow(".tests", ".categories", ".levels", ".all", e=true)
    valueShow(".rule_levels", ".rule_categories", ".rule_tests", e=true)
    setName(".rule_levels", ".rule_categories", ".rule_tests", e=true)
  }
}

function valueShow(c0, c1, c2, e=false) {
  if (e) {
    document.querySelector(c0).classList.add("hide")
  } else {
    document.querySelector(c0).classList.remove("hide") 
  }
  document.querySelector(c1).classList.add("hide")
  document.querySelector(c2).classList.add("hide")
}

function setName(c0, c1, c2, e=false) {
  if (e) {
    document.querySelector(c0).setAttribute("name", "badge[nothing]")
  } else {
    document.querySelector(c0).setAttribute("name", "badge[rule_value]")
  }
  document.querySelector(c1).setAttribute("name", "badge[nothing]")
  document.querySelector(c2).setAttribute("name", "badge[nothing]")

}

function labelShow(c1, c2, c3, c4, e=false) {
  if (e) {
    document.querySelector(c1).classList.add("hide")
  } else {
    document.querySelector(c1).classList.remove("hide") 
  }
  document.querySelector(c2).classList.add("hide")
  document.querySelector(c3).classList.add("hide")
  document.querySelector(c4).classList.add("hide")
}
