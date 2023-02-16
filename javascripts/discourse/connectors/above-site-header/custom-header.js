export default {
  setupComponent(args, component) {
    component.setProperties({
      didInsertElement() {
        this._super(...arguments)

        if (!this.site.mobileView) {
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
        }

        if (this.site.mobileView) {
          $(function () {
            $('.dropdown-toggle').on('click', function () {
              event.stopPropagation()
              $('.community-dropdown').toggle()
            })
            $('.community-dropdown').on('click', function (event) {
              event.stopPropagation()
            })
            $(document).on('click', function () {
              $('.community-dropdown').hide()
            })
          })
        }
      },
    })
  },
}
