\connect dktktest

--
-- Name: entity_type entity_type_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.entity_type
    ADD CONSTRAINT entity_type_parent_fk FOREIGN KEY (parent_id) REFERENCES public.entity_type(id);


--
-- Name: user_role fk143bf46a2e866583; Type: FK CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fk143bf46a2e866583 FOREIGN KEY (user_id) REFERENCES public.user_(id);


--
-- Name: user_role fk143bf46a895ba1a3; Type: FK CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fk143bf46a895ba1a3 FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: query fk66f18c82e866583; Type: FK CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT fk66f18c82e866583 FOREIGN KEY (user_id) REFERENCES public.user_(id);


--
-- Name: mds_b mds_b_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.mds_b
    ADD CONSTRAINT mds_b_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.patient(id);


--
-- Name: mds_k mds_k_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.mds_k
    ADD CONSTRAINT mds_k_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.patient(id);


REFRESH MATERIALIZED VIEW public.mds_k_view;