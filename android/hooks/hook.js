// Require-in modules.
const fs = require('fs');
const path = require('path');
// Get the name of this plugin.
const pluginName = path.basename(path.resolve(__dirname, '..'));
exports.cliVersion = '>=3.2';
exports.init = function (logger, config, cli) {
	// Do not continue if not building for Android.
	if (cli.argv.platform !== 'android') {
		return;
	}
	// Extend root "build.gradle" file settings before build, but after project files have been created.
	cli.on('build.pre.build', (builder, done) => {
		logger.info(`Plugin '${pluginName}' is extending root 'build.gradle' file.`);
		const filePath = path.join(builder.buildDir, 'build.gradle');
		const fileLines = fs.readFileSync(filePath).toString().split('\n');
		fileLines.push('buildscript {');
		fileLines.push('\tdependencies {');
		fileLines.push("\t\tclasspath 'com.google.firebase:firebase-crashlytics-gradle:2.1.0'");
		fileLines.push('\t}');
		fileLines.push('}');
		fs.writeFileSync(filePath, fileLines.join('\n'));
		done();
	});
};