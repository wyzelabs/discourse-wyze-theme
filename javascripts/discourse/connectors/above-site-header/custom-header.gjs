import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { on } from "@ember/modifier";
import { action } from "@ember/object";
import { service } from "@ember/service";
import CustomNewCount from "../../components/custom-new-count";

export default class CustomHeaderComponent extends Component {
  @service site;
  @service siteSettings;

  @tracked dropdownOpen = false;

  @action
  handleDropdownMouseEnter(event) {
    if (!this.site.mobileView) {
      const dropdown = event.target.querySelector(".community-dropdown");
      if (dropdown) {
        dropdown.style.display = "block";
      }
    }
  }

  @action
  handleDropdownMouseLeave(event) {
    if (!this.site.mobileView) {
      const dropdown = event.target.querySelector(".community-dropdown");
      if (dropdown) {
        dropdown.style.display = "none";
      }
    }
  }

  @action
  toggleDropdown(event) {
    if (this.site.mobileView) {
      event.stopPropagation();
      this.dropdownOpen = !this.dropdownOpen;
    }
  }

  @action
  preventClose(event) {
    event.stopPropagation();
  }

  @action
  closeDropdown() {
    if (this.site.mobileView) {
      this.dropdownOpen = false;
    }
  }

  <template>
    {{! eslint-disable-next-line ember/template-no-invalid-interactive }}
    <div class="wyze-nav" {{on "click" this.closeDropdown}}>
      <div class="wrap">
        <div class="left-nav">
          <ul>
            <li class="desktop-only">
              <a href="https://wyze.com/shop-wyze">Shop</a>
            </li>
            {{! eslint-disable-next-line ember/template-no-invalid-interactive }}
            <li
              class="dropdown-toggle"
              {{on "mouseenter" this.handleDropdownMouseEnter}}
              {{on "mouseleave" this.handleDropdownMouseLeave}}
              {{on "click" this.toggleDropdown}}
            >
              <a href="/" class="desktop-only">Forum</a><span
                class="mobile-only"
              >Forum</span>
              {{! eslint-disable-next-line ember/template-no-invalid-interactive }}
              <ul
                class="community-dropdown {{if this.dropdownOpen "mobile-open"}}"
                {{on "click" this.preventClose}}
              >
                <li><a href="/c/news">Wyze News</a></li>
                <li><a href="/c/wishlist/12/l/latest?order=votes">Wishlist</a></li>
                <li><a href="/c/beta">Wyze Beta</a></li>
                <li><a href="/c/wyze-ai">Wyze AI</a></li>
                <li><a href="/c/cameras">Cameras</a></li>
                <CustomNewCount />
                <li><a href="https://forums.wyzecam.com/">See All</a></li>
              </ul>
            </li>
            <li class="desktop-only">
              <a href="https://www.facebook.com/groups/298350110642283">Facebook</a>
            </li>
            <li class="desktop-only">
              <a href="https://www.reddit.com/r/wyzecam">Reddit</a>
            </li>
            <li class="desktop-only">
              <a href="https://wyze.com/community">Social Media</a>
            </li>
          </ul>
        </div>

        {{#if this.siteSettings.logo}}
          <div class="logo">
            <a
              href="https://www.wyze.com/?utm_source=forum&utm_medium=website&utm_campaign=wyze_forums"
            >
              <img class="" src={{this.siteSettings.logo}} />
            </a>
          </div>
        {{/if}}
        <div class="right-nav">
          <ul>
            <li class="mobile-only">
              <a href="https://www.facebook.com/groups/298350110642283">Facebook</a>
            </li>
            <li class="mobile-only">
              <a href="https://www.reddit.com/r/wyzecam">Reddit</a>
            </li>
            <li><a href="https://support.wyzecam.com/">Support</a></li>
            {{! <li><a href="https://wyzecam.com/my-account/">Sign In</a></li> }}
          </ul>
        </div>
      </div>
    </div>
  </template>
}
