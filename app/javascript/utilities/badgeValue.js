document.addEventListener('turbolinks:load', function() {
  var ruleTypeSelector = document.querySelector('#badge_rule')

  if (ruleTypeSelector) {
    ruleTypeSelector.addEventListener('change', ruleValueSelectorChange)
  }
})

function ruleValueSelectorChange() {
  console.log(this.value)
    
  if (this.value == "first_try") {

    document.querySelector(".tests").classList.remove("hide")
    document.querySelector(".categories").classList.add("hide")
    document.querySelector(".levels").classList.add("hide")
    document.querySelector(".all").classList.add("hide")

    document.querySelector(".rule_tests").classList.remove("hide")
    document.querySelector(".rule_categories").classList.add("hide")
    document.querySelector(".rule_levels").classList.add("hide")

  } else if (this.value == "all_by_category") {

    document.querySelector(".categories").classList.remove("hide")
    document.querySelector(".tests").classList.add("hide")
    document.querySelector(".levels").classList.add("hide")
    document.querySelector(".all").classList.add("hide")

    document.querySelector(".rule_categories").classList.remove("hide")
    document.querySelector(".rule_tests").classList.add("hide")
    document.querySelector(".rule_levels").classList.add("hide")

  } else if (this.value == "all_by_level") {

    document.querySelector(".levels").classList.remove("hide")
    document.querySelector(".tests").classList.add("hide")
    document.querySelector(".categories").classList.add("hide")
    document.querySelector(".all").classList.add("hide")

    document.querySelector(".rule_levels").classList.remove("hide")
    document.querySelector(".rule_tests").classList.add("hide")
    document.querySelector(".rule_categories").classList.add("hide")
    
  } else {

    document.querySelector(".all").classList.remove("hide")
    document.querySelector(".levels").classList.add("hide")
    document.querySelector(".tests").classList.add("hide")
    document.querySelector(".categories").classList.add("hide")

    document.querySelector(".rule_tests").classList.add("hide")
    document.querySelector(".rule_categories").classList.add("hide")
    document.querySelector(".rule_levels").classList.add("hide")
  }

  //   ruleValueTestSelector.id = "badge_rule_value"
  //   ruleValueCategorySelector.id = "badge_not_actual_rule_value"
  //   ruleValueTLevelSelector.id = "badge_not_actual_rule_value"

  //   ruleValueTestSelector.setAttribute("name", "badge[rule_value]")
  //   ruleValueCategorySelector.setAttribute("name", "badge[not_actual_rule_value]")
  //   ruleValueTLevelSelector.setAttribute("name", "badge[not_actual_rule_value]")

  //   ruleValueTestParagraph.classList.remove('hide')
  //   ruleValueCategoryParagraph.classList.add('hide')
  //   ruleValueTLevelParagraph.classList.add('hide')

  // } else if (ruleTypeSelectorValue == "all_by_category") {
  //   console.log("all_by_category!")

  //   ruleValueTestSelector.id = "badge_not_actual_rule_value"
  //   ruleValueCategorySelector.id = "badge_rule_value"
  //   ruleValueTLevelSelector.id = "badge_not_actual_rule_value"

  //   ruleValueTestSelector.setAttribute("name", "badge[not_actual_rule_value]")
  //   ruleValueCategorySelector.setAttribute("name", "badge[rule_value]")
  //   ruleValueTLevelSelector.setAttribute("name", "badge[not_actual_rule_value]")

  //   ruleValueTestParagraph.classList.add('hide')
  //   ruleValueCategoryParagraph.classList.remove('hide')
  //   ruleValueTLevelParagraph.classList.add('hide')

  // } else if (ruleTypeSelectorValue == "all_by_level") {
  //   console.log("all_by_level!")

  //   ruleValueTestSelector.id = "badge_not_actual_rule_value"
  //   ruleValueCategorySelector.id = "badge_not_actual_rule_value"
  //   ruleValueTLevelSelector.id = "badge_rule_value"

  //   ruleValueTestSelector.setAttribute("name", "badge[not_actual_rule_value]")
  //   ruleValueCategorySelector.setAttribute("name", "badge[not_actual_rule_value]")
  //   ruleValueTLevelSelector.setAttribute("name", "badge[rule_value]")

  //   ruleValueTestParagraph.classList.add('hide')
  //   ruleValueCategoryParagraph.classList.add('hide')
  //   ruleValueTLevelParagraph.classList.remove('hide')

  // } else if (ruleTypeSelectorValue == "overall") {
  //   console.log("overall!")

  //   ruleValueTestSelector.id = "badge_not_actual_rule_value"
  //   ruleValueCategorySelector.id = "badge_not_actual_rule_value"
  //   ruleValueTLevelSelector.id = "badge_not_actual_rule_value"

  //   ruleValueTestSelector.setAttribute("name", "badge[not_actual_rule_value]")
  //   ruleValueCategorySelector.setAttribute("name", "badge[not_actual_rule_value]")
  //   ruleValueTLevelSelector.setAttribute("name", "badge[not_actual_rule_value]")

  //   ruleValueTestParagraph.classList.add('hide')
  //   ruleValueCategoryParagraph.classList.add('hide')
  //   ruleValueTLevelParagraph.classList.add('hide')

  // }
}