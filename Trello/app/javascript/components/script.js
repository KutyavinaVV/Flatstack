import orderBy from 'lodash/orderBy';

class Sorter {
  constructor($el) {
    this.$el = $el;
    const items = this.$el.querySelectorAll('.js-item');

    this.sortButtonASC = this.$el.querySelector('.js-sort-asc');
    this.sortButtonDESC = this.$el.querySelector('.js-sort-desc');
    this.list = this.$el.querySelector('.js-list');
    this.dataAttributes = Array.from(items).map(
      (item) => ({
        node: item,
        ...JSON.parse(item.getAttribute('data-list')),
      }),
    );

    this.bindEvents();
  }

  bindEvents() {
    this.sortButtonASC.addEventListener('click', this.sortByTitleASC);
    this.sortButtonDESC.addEventListener('click', this.sortByTitleDESC);
  }

    sortByTitleASC = () => {
      this.sortButtonASC.classList.add('hidden');
      this.sortButtonASC.classList.remove('button');
      this.sortButtonDESC.classList.remove('hidden');
      this.sortButtonDESC.classList.add('button');
      const sorteItemByTitleAsc = orderBy(this.dataAttributes, ['title'], ['asc']);
      sorteItemByTitleAsc.forEach((item) => this.list.appendChild(item.node));
    }

    sortByTitleDESC = () => {
      this.sortButtonDESC.classList.add('hidden');
      this.sortButtonDESC.classList.remove('button');
      this.sortButtonASC.classList.add('button');
      this.sortButtonASC.classList.remove('hidden');
      const sortItemByTitleDesc = orderBy(this.dataAttributes, ['title'], ['desc']);
      sortItemByTitleDesc.forEach((item) => this.list.appendChild(item.node));
    }


}

export default Sorter;
