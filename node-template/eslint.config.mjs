import { configs as eslintCommentConfigs } from "eslint-plugin-eslint-comments";
import globals from "globals";
import { configs as typescriptConfigs } from "typescript-eslint";
import { configs as reactConfigs } from "eslint-plugin-react";
import { configs as reactHooksConfigs } from "eslint-plugin-react-hooks";

const shared = {
  languageOptions: { globals: { ...globals.browser, ...globals.node } },
  plugins: {
    "eslint-comments": (await import("eslint-plugin-eslint-comments")).default,
    import: (await import("eslint-plugin-import")).default,
    "simple-import-sort": (await import("eslint-plugin-simple-import-sort"))
      .default,
    "sort-keys": (await import("eslint-plugin-sort-keys")).default,
  },
  rules: {
    ...eslintCommentConfigs.recommended.rules,
    curly: "error",
    "eslint-comments/no-unused-disable": "error",
    "import/ignore": ["node_modules", "\\.(css|md|svg|json)$"],
    "import/no-extraneous-dependencies": "error",
    "import/resolver": {
      // [await import("eslint-import-resolver-node")]: {
      //   extensions: [".js", ".jsx", ".ts", ".tsx"],
      // },
      [await import("eslint-import-resolver-typescript")]: {
        alwaysTryTypes: true,
      },
    },
    "simple-import-sort/exports": "error",
    "simple-import-sort/imports": "error",
    "sort-keys-fix/sort-keys-fix": "error",
  },
};

const react = {
  plugins: {
    react: (await import("eslint-plugin-react")).default,
    "react-hooks": (await import("eslint-plugin-react-hooks")).default,
  },
  languageOptions: {
    parser: (await import("typescript-eslint")).parser,
    parserOptions: { jsx: true },
  },
  rules: {
    ...reactConfigs.recommended.rules,
    ...reactHooksConfigs.recommended.rules,
  },
};

const jsRules = [
  {
    files: ["**/*.js?(x)"],
    rules: {
      "no-unused-vars": [
        WARN,
        {
          args: "after-used",
          argsIgnorePattern: "^_",
          ignoreRestSiblings: true,
          varsIgnorePattern: "^ignored",
        },
      ],
    },
  },
];

const tsRules = {
  files: ["**/*.ts?(x)"],
  languageOptions: {
    parser: (await import("typescript-eslint")).parser,
    parserOptions: { projectService: true },
  },
  plugins: {
    import: (await import("eslint-plugin-import")).default,
    "@typescript-eslint": (await import("typescript-eslint")).plugin,
  },
  rules: {
    ...typescriptConfigs.eslintRecommended.rules,
    ...typescriptConfigs.strict.rules,
    ...typescriptConfigs.stylistic.rules,
    "@typescript-eslint/consistent-type-imports": [
      WARN,
      {
        prefer: "type-imports",
        disallowTypeAnnotations: true,
        fixStyle: "inline-type-imports",
      },
    ],
    "@typescript-eslint/no-misused-promises": [
      "error",
      { checksVoidReturn: false },
    ],
    "@typescript-eslint/no-unused-vars": [
      WARN,
      {
        args: "after-used",
        argsIgnorePattern: "^_",
        ignoreRestSiblings: true,
        varsIgnorePattern: "^ignored",
      },
    ],
    "import/consistent-type-specifier-style": [WARN, "prefer-inline"],
    "import/parsers": {
      [(await import("typescript-eslint")).parser]: [".ts", ".tsx", ".d.ts"],
    },
    "import/resolver": {
      // [await import("eslint-import-resolver-node")]: {
      //   extensions: [".js", ".jsx", ".ts", ".tsx"],
      // },
      [await import("eslint-import-resolver-typescript")]: {
        alwaysTryTypes: true,
      },
    },
  },
};

const eslintIgnore = {
  // .eslintignore file seems to be ignored; inlining ignore patterns
  ignores: [
    "!.storybook",
    ".DS_Store",
    ".husky",
    "build",
    "coverage",
    "dist",
    "node_modules",
    "storybook-static",
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
    "public/mockServiceWorker.js",
  ],
};

export default [eslintIgnore, shared, jsRules, tsRules, react];
