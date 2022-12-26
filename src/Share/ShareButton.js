
export function copyToClipboard(string, copyCb, failCb) {
    try {
      navigator.clipboard.writeText(string).then(
        () => copyCb(),
        () => failCb()
      );
    } catch (_error) {
      failCb();
    }
  }