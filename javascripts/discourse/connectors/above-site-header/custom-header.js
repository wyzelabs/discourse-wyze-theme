import Component from "@glimmer/component";
import { action } from "@ember/object";
import { tracked } from "@glimmer/tracking";
import { inject as service } from "@ember/service";

export default class CustomHeaderComponent extends Component {
  @service site;
  @tracked dropdownOpen = false;

  @action
  handleDropdownMouseEnter(event) {
    if (!this.site.mobileView) {
      const dropdown = event.target.querySelector('.community-dropdown');
      if (dropdown) {
        dropdown.style.display = 'block';
      }
    }
  }

  @action
  handleDropdownMouseLeave(event) {
    if (!this.site.mobileView) {
      const dropdown = event.target.querySelector('.community-dropdown');
      if (dropdown) {
        dropdown.style.display = 'none';
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
}
