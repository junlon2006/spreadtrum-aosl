#
# AOSL (Advanced Operating System Layer) - cross-platform OS abstraction library
# aosl/aosl.mk
#

#
# RVCT (ARMCC) compatibility for AOSL:
# - --c99: enable C99 mode (mixed declarations, for-init, designated initializers, zero-length arrays)
# - -D__ARMEL__: identify ARM little-endian (for AOSL byteorder detection)
# These flags are safe from MCFLAG_OPT subst rules (no -g, -zc, -zo etc. substrings).
#
MCFLAG_OPT += --c99 -D__ARMEL__ -DCONFIG_AOSL_IPV6

MINCPATH += \
    . \
    DAPS/export/inc/tcpip6 \
    MS_MMI_Main/source/mmi_app/app/aosl/include \
    MS_MMI_Main/source/mmi_app/app/aosl/include/api \
    MS_MMI_Main/source/mmi_app/app/aosl/include/kernel \
    MS_MMI_Main/source/mmi_app/app/aosl/platform/include \
    MS_MMI_Main/source/mmi_app/app/aosl/platform/include/hal \
    MS_MMI_Main/source/mmi_app/app/aosl/platform/src/spreadtrum-w117/config

#
# AOSL core - kernel
#
MSRCPATH += MS_MMI_Main/source/mmi_app/app/aosl/kernel
SOURCES += fileobj.c \
    iofd.c \
    timer.c \
    osmp.c \
    mpq.c \
    mpqp.c \
    refobj.c \
    file.c \
    time.c \
    log.c \
    panic.c \
    version.c \
    thread.c \
    select_mp.c \
    poll_mp.c \
    et_mp.c \
    rt_monitor.c

#
# AOSL core - lib
#
MSRCPATH += MS_MMI_Main/source/mmi_app/app/aosl/lib
SOURCES += thread_api.c \
    atomic.c \
    bitmap.c \
    rbtree.c \
    marshalling.c \
    marshalling-base-obj.c \
    psbuff.c \
    tls.c \
    utils.c \
    cond.c \
    rwlockimpl.c \
    rwlock.c \
    byteswap.c \
    errno.c

#
# AOSL core - mm
#
MSRCPATH += MS_MMI_Main/source/mmi_app/app/aosl/mm
SOURCES += mm.c

#
#
# AOSL core - net
#
MSRCPATH += MS_MMI_Main/source/mmi_app/app/aosl/net
SOURCES += netifs.c \
    route.c \
    sk_utils.c \
    inet.c \
    ipv6.c \
    dns.c

#
# AOSL platform adaptation for spreadtrum-t117 (ThreadX/SCI API)
#
MSRCPATH += MS_MMI_Main/source/mmi_app/app/aosl/platform/src/spreadtrum-t117
SOURCES += aosl_hal_atomic.c \
    aosl_hal_errno.c \
    aosl_hal_file.c \
    aosl_hal_iomp.c \
    aosl_hal_log.c \
    aosl_hal_memory.c \
    aosl_hal_socket.c \
    aosl_hal_thread.c \
    aosl_hal_time.c \
    aosl_hal_utils.c
