export default {
  setupComponent(args, component) {
    component.setProperties({
      didInsertElement() {
        this._super(...arguments)
        ;(function ($) {
          $('.dropdown-toggle').hover(
            function () {
              $(this)
                .children('.community-dropdown')
                .stop(true, true)
                .slideDown('fast')
            },
            function () {
              $(this)
                .children('.community-dropdown')
                .stop(true, true)
                .slideUp('slow')
            }
          )
        })(jQuery)
      },
    })
  },
}
