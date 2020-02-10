BuildAPKs GitHub ` *NAMES ` README.md

The ` build.github*.bash ` commands use the ~/buildAPKs/var/db directory to assist in building APKs from GitHub.  The [db.BuildAPKs](https://github.com/BuildAPKs/db.BuildAPKs/) repository is this directory archived.  The git repository [db.BuildAPKs](https://github.com/BuildAPKs/db.BuildAPKs/) installs as a module into ~/buildAPKs/opt/db once https://github.com/BuildAPKs is installed.

BASH command [`build.github.bash`](https://raw.githubusercontent.com/BuildAPKs/buildAPKs.github/master/build.github.bash) can build all the APK repos in a GitHub account on device today!  When you find a GitHub username that builds with buildAPKs, consider adding to buildAPKs by submitting a [pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request) at [db.BuildAPKs/pulls](https://github.com/BuildAPKs/db.BuildAPKs/pulls) by adding to one or more of the ` *NAMES ` files, and possibly to an appropriate ` ma.bash ` file with project source code commit reference if a project merritt's this inclusion.

Two very simple pull requests can be submitted:  One in db.BuildAPKs by adding a name to the corresponding ` *NAMES ` file or files, a login name in each corresponding file per GitHub account.  The second pull request can be added in an appropriate [BuildAPKs](https://github.com/BuildAPKs) module repository by adding an <code> _AT_ </code> line in the suitable ma.bash file, one line of code per project.  If a GitHub account has many interesting projects, then multiple buildAPKs module repositories can recieve pull requests regarding the same user's projects.    

1) To see the available ma.bash files you can use: 
<code> find ~/buildAPKs/sources/ -type f -name ma.bash -exec cat {} \; </code>

2) The lines concerning individual APK projects in ma.bash are: 
<code> grep -hr _AT_ ~/buildAPKs/sources/ </code>

The ma.bash file usage is: <code> _AT_ login/repo commit </code> and the file ~/buildAPKs/.gitmodules has information about each module repository.  The modules located in ~/buildAPKs/sources/ contain module themed ma.bash files.  Running ~/buildAPKs/build.buildAPKs.modules.bash will populate the ` .gitmodules ` file and the modules.  The <code> _AT_ </code> function itself is located in <code> grep -r _AT_ ~/buildAPKs/scripts/ </code> after the corresponding modules have been cloned into the ~/buildAPKs directory.

Files var/db/[BEOU]NAMES may contain duplicate names.  Depreciated file ` rm.dups.bash ` has more information.  

Files ~/buildAPKs/.var/db/[PRXZ]NAMES may also contain duplicate names. However, these files halt the build process.  Remove the corresponding account name from the var/db/[PRXZ]NAMES file(s) and the ~/buildAPKs/sources/github/{orgs,users}/name directory to continue to attempt to process this Github login if BuildAPKs created this directory.  Removing the corresponding ~/buildAPKs/sources/github/{orgs,users}/name directory and the name from the NAMES file(s) will continue the build process this Github login.

These files are located in ~/buildAPKs/var/db and their purpose is outlined in this table:

| File Name    | Purpose    |
| ------------ | ---------  |
| ANAMES †     | user created listing for APK project names that will NOT be downloaded and built |
| BNAMES ∆     | login names, download size, build time, number of AndroidManifest.xml files found and APKs built that built at least 1 APK on device |
| B10NAMES ∆   | login names, download size, build time, number of AndroidManifest.xml files found and APKs built that built at least 10 APKs on device |
| B100NAMES ∆  | login names, download size, build time, number of AndroidManifest.xml files found and APKs built that built at least 100 APKs on device |
| B1KNAMES ∆   | login names, download size, build time, number of AndroidManifest.xml files found and APKs built that built at least 1000 APKs on device |
| DNAMES ∆     | login names and built date pairs |
| ENAMES       | login names with exceptional APK projects |
| FNAMES ∆     | login names and build time pairs |
| MNAMES ∆     | login names and number of AndroidManifest.xml files pairs |
| NUNAMES      | login names with possible new APKs that might migrate to ma.bash |
| GNAMES ∆     | login names and login type pairs |
| ONAMES       | organization names whose APKs build in buildAPKs on device |
| PNAMES †∆     | pending names that are NOT downloaded and built, but might transition to ONAMES, UNAMES and ma.bash |
| QNAMES ∆     | accounts that have at least one AndroidManifest.xml file |
| README.md    | this file |
| SNAMES ∆     | login names and download size pairs |
| TNAMES       | GitHub topics that build with buildAPKs on device |
| WNAMES ∆     | login names and built APK projects pairs |
| UNAMES       | login names names that have APK projects that build with buildAPKs on device |
| XNAMES †     | user created listing for accounts that will NOT be downloaded and built |
| YNAMES †∆    | accounts that have AndroidManifest.xml file(s), but did not build any APKs with buildAPKs |
| ZNAMES †∆    | account names that have zero APK projects |
| mN.bash      | merge NAMES files from var/db into db.BuildAPKs |
| rm.dups.bash | Depreciated: parses files for duplicate names |

† names and projects that are NOT built

∆ system files

[Awk](https://www.gnu.org/software/gawk/manual/) can be used ` awk 'NR>=20 && NR<=52' ~/buildAPKs/var/db/README.md ` to view the \*NAMES files table in this file.  Use ` grep ∆ ~/buildAPKs/var/db/README.md ` to view only the \*NAMES system files and their definition.

Change requests to the database located at [db.BuildAPKs](https://github.com/BuildAPKs/db.BuildAPKs/) may be proposed [here](https://github.com/BuildAPKs/db.BuildAPKs/pulls).

This command: ` grep NAMES ~/buildAPKs/var/db/README.md | grep \| | awk '{print $2}' | cut -c 1 | sort | uniq | cat ` assists in maintaining the file name structure.  These files contain data pair types:

| DNAMES ∆     | login names and built date pairs |
| FNAMES ∆     | login names and build time pairs |
| GNAMES ∆     | login names and login type pairs |
| MNAMES ∆     | login names and number of AndroidManifest.xml files pairs |
| SNAMES ∆     | login names and download size pairs |
| WNAMES ∆     | login names and built APK projects pairs |

##### Some source pages for NUNAMES:
   * [https://github.com/amitshekhariitbhu/awesome-android-complete-reference](https://github.com/amitshekhariitbhu/awesome-android-complete-reference)
   * [https://github.com/ashishb/android-security-awesome](https://github.com/ashishb/android-security-awesome)
   * [https://github.com/JStumpp/awesome-android](https://github.com/JStumpp/awesome-android)
   * [https://github.com/Mybridge/amazing-android-apps](https://github.com/Mybridge/amazing-android-apps)
   * [https://github.com/Trinea/android-open-project](https://github.com/Trinea/android-open-project)
   * [https://github.com/wasabeef/awesome-android-ui](https://github.com/wasabeef/awesome-android-ui)

##### Information about shells:
   * [https://developer.ibm.com/tutorials/l-linux-shells/](https://developer.ibm.com/tutorials/l-linux-shells/)
   * [https://www.gnu.org/software/bash/manual/bash.html](https://www.gnu.org/software/bash/manual/bash.html)
   * [http://www.tldp.org/guides.html](http://www.tldp.org/guides.html)

NOTE:  Adding a username token pair to ~/buildAPKs/.conf/GAUTH will increase the rate limit for authenticated users of GitHub.  Use this OATH token file to enable OAuth authentication.  To create an OAuth token, you can use https://github.com/settings/tokens and insert this token into the first line in GAUTH.  File [GAUTH](https://raw.githubusercontent.com/BuildAPKs/buildAPKs/master/.conf/GAUTH) has more information.  
<!-- README.md EOF -->
