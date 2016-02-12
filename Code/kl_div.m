function [ dist ] = kl_div( p, q, a)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
p=p.';
q=q.';

m_p = p(1:a,:);
c_p = reshape(p(a+1:end,:),a,a).';
m_q = q(1:a,:);
c_q = reshape(q(a+1:end,:),a,a).';

p_q = trace(c_q\c_p) + ((m_q - m_p).')*(inv(c_q))*(m_q - m_p) + log((det(c_q))/(det(c_p))) - 1;
q_p = trace(c_p\c_q) + ((m_p - m_q).')*(inv(c_p))*(m_p - m_q) + log((det(c_p))/(det(c_q))) - 1;

dist=0.5 * (p_q + q_p);
end

