// npm i -D @eslint/js eslint eslint-import-resolver-node eslint-import-resolver-typescript eslint-plugin-eslint-comments eslint-plugin-import eslint-plugin-react eslint-plugin-react-hooks eslint-plugin-react-refresh eslint-plugin-simple-import-sort eslint-plugin-sort-keys-fix prettier typescript-eslint
import eslint from "@eslint/js";
import eslintComments from "eslint-plugin-eslint-comments";
import react from "eslint-plugin-react";
import reactHooks from "eslint-plugin-react-hooks";
import simpleImportSort from "eslint-plugin-simple-import-sort";
import sortKeysFix from "eslint-plugin-sort-keys-fix";
import globals from "globals";
import typescriptEslint from "typescript-eslint";

/**  @type {import("eslint").Linter.Config} */
const eslintIgnore = {
  ignores: [
    ".DS_Store",
    ".husky",
    "build",
    "coverage",
    "dist",
    "node_modules",
    ".*ignore",
    ".editorconfig",
    ".env",
    ".env.*",
    ".git*",
    ".tool-versions",
    "*.css",
    "*.scss",
    "*.sass",
    "env.*",
    "package-lock.json",
  ],
};

/**  @type {import("eslint").Linter.Config} */
const baseConfig = {
  languageOptions: {
    globals: { ...globals.browser, ...globals.node },
    parser: typescriptEslint.parser,
    parserOptions: { jsx: true, projectService: { allowDefaultProject: ["eslint.config.mjs"] } },
  },
  plugins: {
    "eslint-comments": eslintComments,
    import: (await import("eslint-plugin-import")).default,
    react,
    "react-hooks": reactHooks,
    "simple-import-sort": simpleImportSort,
    "sort-keys-fix": sortKeysFix,
    "typescript-eslint": typescriptEslint,
  },
  rules: {
    // eslint-plugin-eslint-comments is in the legacy eslint format
    ...eslintComments.configs.recommended.rules,
    // eslint-plugin-react is in the legacy eslint format
    ...react.configs.recommended.rules,
    // eslint-plugin-react-hooks is in the legacy eslint format
    ...reactHooks.configs.recommended.rules,
    "@typescript-eslint/consistent-type-imports": [
      "warn",
      { disallowTypeAnnotations: true, fixStyle: "inline-type-imports", prefer: "type-imports" },
    ],
    "@typescript-eslint/no-misused-promises": ["error", { checksVoidReturn: false }],
    "@typescript-eslint/no-unused-vars": [
      "warn",
      { args: "after-used", argsIgnorePattern: "^_", ignoreRestSiblings: true, varsIgnorePattern: "^ignored" },
    ],
    curly: "error",
    "eslint-comments/no-unused-disable": "error",
    "import/consistent-type-specifier-style": ["warn", "prefer-inline"],
    "import/no-extraneous-dependencies": "error",
    "no-unused-vars": [
      "warn",
      { args: "after-used", argsIgnorePattern: "^_", ignoreRestSiblings: true, varsIgnorePattern: "^ignored" },
    ],
    "react/prop-types": "off",
    "react/react-in-jsx-scope": "off",
    "simple-import-sort/exports": "error",
    "simple-import-sort/imports": [
      "error",
      { groups: [["^\\u0000"], ["^@?\\w"], ["^~?\\w"], ["^"], ["^\\."], ["^.+\\u0000$"]] },
    ],
    "sort-keys-fix/sort-keys-fix": "error",
  },
  settings: {
    "import/ignore": ["node_modules", "\\.(css|md|svg|json)$"],
    "import/parsers": { "@typescript-eslint/parser": [".js", ".jsx", ".ts", ".tsx", ".d.ts"] },
    "import/resolver": {
      project: ["packages/**/tsconfig.json", "extensions/**/tsconfig.json"],
      typescript: { alwaysTryTypes: true },
    },
    react: { version: "detect" },
  },
};

// applies to tests, stories and other files that exist strictly to support development effort
/**  @type {import("eslint").Linter.Config} */
const devToolingConfig = {
  files: ["*.config.m[j|t]s", "**/*.test.[j|t]s?(x)"],
  rules: {
    "@typescript-eslint/consistent-type-imports": "off",
    "@typescript-eslint/no-non-null-assertion": "off",
    "import/no-extraneous-dependencies": "off",
  },
};

export default [
  eslintIgnore,
  eslint.configs.recommended,
  ...typescriptEslint.configs.recommended,
  ...typescriptEslint.configs.strict,
  ...typescriptEslint.configs.stylistic,
  baseConfig,
  devToolingConfig,
];
