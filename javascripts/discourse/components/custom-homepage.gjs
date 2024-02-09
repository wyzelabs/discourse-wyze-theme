import Component from "@glimmer/component";
import { inject as service } from "@ember/service";
import bodyClass from "discourse/helpers/body-class";
import { defaultHomepage } from "discourse/lib/utilities";
import icon from "discourse-common/helpers/d-icon";

export default class CustomHomepage extends Component {
  @service site;
  @service router;

  get displayCustomHomepage() {
    return this.router.currentRouteName === `discovery.${defaultHomepage()}`;
  }
 
  <template>
    {{#if this.displayCustomHomepage}}
    {{bodyClass "show-custom-homepage"}}
      <div class="custom-homepage-wrapper">
        <div class="wrap wrap-category-boxes">
          <div class="custom-homepage-category-title"> 
            <h2>Categories</h2>
          </div>
          <div class="homepage-category-boxes">
            {{#each this.site.categories as |c|}}
            <a href="/c/{{c.slug}}" class="box">
              <div class="homepage-category-box">
                {{#if c.uploaded_logo}}
                <div class="category-image-wrapper">
                  <img class="homepage-category-image" src="{{c.uploaded_logo.url}}" />
                </div>
                {{/if}}
                <h2>{{#if c.read_restricted}}{{icon "lock"}}{{/if}}{{c.name}}</h2>
                <div class="homepage-category-box-count">{{icon "comments"}} {{c.topic_count}}</div>
              </div>
            </a>
            {{/each}}
          </div>
        </div>
      </div>
    {{/if}}
  </template>
}
