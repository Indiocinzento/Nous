log_nous() {
  python3 - "$@" <<'PY'
from nous_logger import log_event
import sys, json

if len(sys.argv) < 6:
    raise SystemExit("uso: actor tool action result_json sandbox")

actor, tool, action, result, sandbox = sys.argv[1:6]

try:
    result_obj = json.loads(result)
except json.JSONDecodeError:
    # se não for JSON, guarda como string mesmo
    result_obj = {"raw": result}

log_event(actor, tool, action, result_obj, sandbox.lower() == "true")
PY
}
log_nous "mom" "fs_tools" "list_memu" '{"ok": true}' "true"
