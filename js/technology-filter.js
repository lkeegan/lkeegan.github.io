const panel = document.querySelector("#technology-panel");
const drawer = document.querySelector("#technology-drawer");
const layout = document.querySelector(".projects-layout");
const tagContainer = document.querySelector("#technology-tags");
const clearButton = document.querySelector("#clear-technology");
const selectedLabel = document.querySelector("#selected-technology-label");
const status = document.querySelector("#project-filter-status");
const previewPanel = document.querySelector(".technology-preview");
const previewList = document.querySelector("#technology-preview-list");

if (
  panel &&
  drawer &&
  layout &&
  tagContainer &&
  clearButton &&
  selectedLabel &&
  status &&
  previewPanel &&
  previewList
) {
  const desktopWidth = window.matchMedia("(min-width: 921px)");
  const syncDrawer = () => {
    drawer.open = desktopWidth.matches;
  };
  syncDrawer();
  desktopWidth.addEventListener("change", syncDrawer);

  const normalizeTag = (tag) => (tag.startsWith("C++") ? "C++" : tag);
  const entries = Array.from(
    document.querySelectorAll(".filterable-entry"),
  ).map((element) => ({
    element,
    title: element.dataset.title,
    tags: new Set((JSON.parse(element.dataset.tags) || []).map(normalizeTag)),
  }));

  const counts = new Map();
  for (const entry of entries) {
    for (const tag of entry.tags) {
      counts.set(tag, (counts.get(tag) || 0) + 1);
    }
  }

  let activeTag = null;
  let previewTag = null;
  const buttons = new Map();

  function render() {
    const shownTag = previewTag || activeTag;
    const matches = entries.filter(
      (entry) => !shownTag || entry.tags.has(shownTag),
    );

    for (const entry of entries) {
      entry.element.hidden = !matches.includes(entry);
    }

    status.hidden = !shownTag;
    previewPanel.hidden = !shownTag;
    if (shownTag) {
      const noun =
        matches.length === 1 ? panel.dataset.singular : panel.dataset.plural;
      const isPreview = previewTag && previewTag !== activeTag;
      status.textContent = `${isPreview ? "Previewing " : "Showing "}${matches.length} ${noun} using ${shownTag}`;
      previewList.replaceChildren(
        ...matches.map((entry) => {
          const item = document.createElement("li");
          item.textContent = entry.title;
          return item;
        }),
      );
    } else {
      status.textContent = "";
      previewList.replaceChildren();
    }

    clearButton.setAttribute("aria-pressed", String(activeTag === null));
    selectedLabel.textContent = activeTag || clearButton.textContent;
    for (const [tag, button] of buttons) {
      button.setAttribute("aria-pressed", String(activeTag === tag));
    }
  }

  for (const tag of Array.from(counts.keys()).sort((a, b) =>
    a.localeCompare(b),
  )) {
    const button = document.createElement("button");
    button.type = "button";
    button.dataset.tag = tag;
    button.setAttribute("aria-pressed", "false");

    const label = document.createElement("span");
    label.textContent = tag;
    const count = document.createElement("span");
    count.className = "technology-count";
    count.textContent = counts.get(tag);
    button.append(label, count);

    button.addEventListener("pointerenter", () => {
      previewTag = tag;
      render();
    });
    button.addEventListener("focus", () => {
      previewTag = tag;
      render();
    });
    button.addEventListener("click", () => {
      activeTag = activeTag === tag ? null : tag;
      previewTag = activeTag;
      render();
      if (!desktopWidth.matches) drawer.open = false;
    });

    buttons.set(tag, button);
    tagContainer.append(button);
  }

  clearButton.addEventListener("focus", () => {
    previewTag = null;
    render();
  });
  clearButton.addEventListener("click", () => {
    activeTag = null;
    previewTag = null;
    render();
    if (!desktopWidth.matches) drawer.open = false;
  });
  panel.addEventListener("pointerleave", () => {
    previewTag = null;
    render();
  });
  panel.addEventListener("focusout", (event) => {
    if (!panel.contains(event.relatedTarget)) {
      previewTag = null;
      render();
    }
  });

  layout.classList.add("has-filters");
  panel.hidden = false;
  render();
}
