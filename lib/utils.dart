class Utils
{
   static String getImagePath(String userId, int iconTime) {
    //  ${MINDS_CDN_URI}icon/${this.guid}/${size}/${this.getOwnerIcontime()}

    return 'https://' +
        "ops.doesntexist.com" +
        '/icon/' +
        userId +
        '/medium/' +
        iconTime.toString();
  }

}