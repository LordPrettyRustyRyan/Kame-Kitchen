document.addEventListener("DOMContentLoaded", () => {
    const curtain = document.getElementById("curtain");
    let triggered = false;

    document.body.classList.add("curtain-active");

    const openCurtain = () => {
        if (triggered) return;
        triggered = true;

        curtain.classList.add("open");

        setTimeout(() => {
            curtain.remove();
            document.body.classList.remove("curtain-active");
        }, 1200);
    };

    // Scroll trigger (once)
    window.addEventListener("wheel", openCurtain, { once: true });

    // Touch trigger
    window.addEventListener("touchstart", openCurtain, { once: true });

    // Click trigger
    curtain.addEventListener("click", openCurtain);

    // Keyboard fallback
    window.addEventListener("keydown", (e) => {
        if (
            e.key === "ArrowDown" ||
            e.key === "Enter" ||
            e.key === " "
        ) {
            e.preventDefault();
            openCurtain();
        }
    }, { once: true });
});