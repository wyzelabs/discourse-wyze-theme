import Component from '@glimmer/component'
import { inject as service } from '@ember/service'
import { tracked } from '@glimmer/tracking'
import { withPluginApi } from 'discourse/lib/plugin-api'

export default class CustomNewCount extends Component {
  @service currentUser
  @service topicTrackingState
  @tracked totalNew = 0

  constructor() {
    super(...arguments)
    this.#refreshCounts()

    withPluginApi('0.1', api => {
      api.onPageChange(() => {
        this.#refreshCounts()
      })
    })
  }

  #refreshCounts() {
    if (!this.currentUser) {
      return
    }

    this.totalNew = this.topicTrackingState.countNew()
  }
}
