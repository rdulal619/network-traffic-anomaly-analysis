-- SQL Diagnostic: Network Traffic Analysis
-- Author: Reshan Dulal

-- Q1: Total bytes transferred per protocol
SELECT
    protocol,
    SUM(bytes_transferred) AS total_bytes
FROM network_logs
GROUP BY protocol;
