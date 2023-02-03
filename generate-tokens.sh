# Remove the old tokens.
rm -rf Sources/CompoundTokens

# # Get the latest tokens.
yarn upgrade

# # Build the tokens.
cd node_modules/@vector-im/compound/design-tokens
yarn install --frozen-lockfile
yarn build

# Copy the tokens.
mv assets/ios/swift ../../../../Sources/CompoundTokens
