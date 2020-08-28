$(document).ready(function(){
    $("#editDayForm").submit(function(event) {
        console.log("Submitting form to edit day");
        var orbNameArray = ["storyParalogueOrbs","storyParalogueDesc","chainChallengeOrbs","chainChallengeDesc",
            "squadAssaultOrbs","squadAssaultDesc","arenaOrbs","arenaDesc","rivalDomainsOrbs","rivalDomainsDesc","heroBattleOrbs",
            "heroBattleDesc","tacticsDrillOrbs","tacticsDrillDesc","allegianceBattleOrbs",
            "allegianceBattleDesc","tempestTrialsOrbs","tempestTrialsDesc","tapBattleOrbs",
            "tapBattleDesc","grandConquestRokkrSiegesOrbs","grandConquestRokkrSiegesDesc","forgingBondsHallOfFormsOrbs",
            "forgingBondsHallOfFormsDesc","lostLoreOrbs","lostLoreDesc","questOrbs",
            "questDesc","loginBonusOrbs","loginBonusDesc","eventOrbs",
            "eventDesc","compensationOrbs","compensationDesc"];
        var isValidForm = true;
        // Loop for each pair
        for (var x = 0; x < orbNameArray.length-1; x += 2) {
            // Get current id names
            var $orbName = "#"+orbNameArray[x];
            var $orbDesc = "#"+orbNameArray[x+1];
            // Remove classes if needed
            $($orbName).removeClass("is-invalid");
            $($orbDesc).removeClass("is-invalid");
            // If orb value is negative or not an integer
            if ($($orbName).val() < 0 || $($orbName).val() % 1 != 0) {
                $($orbName).addClass("is-invalid");
                isValidForm = false;
            }
            // If text field is empty while orb value is positive
            if ($($orbDesc).val() == "" && $($orbName).val() > 0) {
                $($orbDesc).addClass("is-invalid");
                isValidForm = false;
            }
        }
        // If any field is invalid, do NOT submit form
        if (!isValidForm) {
            event.preventDefault();
        }
    });

});