// @ts-check

import eslint from '@eslint/js'
import tseslint from 'typescript-eslint'

export default tseslint.config(
    eslint.configs.recommended,
    ...tseslint.configs.recommended,
    {
        rules: {
            'semi': ['error', 'never'],
            '@typescript-eslint/semi': ['error', 'never'],
            '@typescript-eslint/no-unused-vars': ['error', {
                'argsIgnorePattern': '^_',
                'varsIgnorePattern': '^_'
            }]
        }
    },
    {
        ignores: ['dist/**', '**/*.js', 'node_modules/**', 'lib/**']
    }
)
