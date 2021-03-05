'use strict';

define([
  '../../../../assets/customPromptTypes/linked_table_counting',
  '../../../../assets/customPromptTypes/next_extid',
  '../../../../assets/customPromptTypes/customToc',
  '../../../../assets/customPromptTypes/customNote',
  'promptTypes',
  'controller',
  'formulaFunctions',
  'jquery',
  '../../../../assets/customPromptTypes/hamlet_info'
], function (linked_table_counting,
             next_extid,
             customToc,
             customNote,
             promptTypes,
             controller,
             formulaFunctions,
             $
) {
  formulaFunctions.fixHhId = function (hhId) {
    if (!!hhId && /^[A-Za-z]{3}-?[0-9]{1,3}$/.test(hhId.trim())) {
      hhId = hhId.trim().toUpperCase();
      var hamlet = hhId.slice(0, 3);
      var id = odkCommon.padWithLeadingZeros(hhId.match(/[0-9]+$/), 3);

      return hamlet + '-' + id;
    }

    // hhId is in an unrecognized form, unable to fix
    return hhId;
  }

  return Object.assign({}, linked_table_counting, next_extid, customToc, customNote, {
    exit_survey: promptTypes.base.extend({
      type: 'exit_survey',
      template: function () {
        return '';
      },
      valid: true,
      afterRender: function () {
        $(document)
          .on('bohemiaExitSurvey', function (evt) {
            controller.screenManager.ignoreChanges(evt);
          })
          .trigger('bohemiaExitSurvey');
      }
    })
  });
});
