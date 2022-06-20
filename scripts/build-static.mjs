import shell from "shelljs";

export function buildStatic() {
  // for now just copy all src files to dist
  shell.mkdir("-p", "./dist");
  shell.cp("-r", "./src/*", "./dist/.");
}
