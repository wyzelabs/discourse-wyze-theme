import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { service } from "@ember/service";
import { withPluginApi } from "discourse/lib/plugin-api";
import { eq } from "discourse/truth-helpers";

export default class CustomNewCount extends Component {
  @service currentUser;
  @service topicTrackingState;

  @tracked totalNew = 0;

  constructor() {
    super(...arguments);
    this.#refreshCounts();

    withPluginApi((api) => {
      api.onPageChange(() => {
        this.#refreshCounts();
      });
    });
  }

  #refreshCounts() {
    if (!this.currentUser) {
      return;
    }

    this.totalNew = this.topicTrackingState.countNew();
  }

  <template>
    {{#if this.currentUser}}
      <li>
        <a href="/new">New topics
          {{#unless (eq this.totalNew 0)}}
            ({{this.totalNew}})
          {{/unless}}
        </a>
      </li>
    {{/if}}
  </template>
}
